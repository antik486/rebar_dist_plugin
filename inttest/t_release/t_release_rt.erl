-module(t_release_rt).

-compile(export_all).

-include_lib("eunit/include/eunit.hrl").

files() ->
    [{copy,
        "../../examples/release-tarball", "release-tarball"},
     {copy, "rebar.config", "release-tarball/rebar.config"}].

run(_Dir) ->
    Verbose = case rebar_config:is_verbose() of
        true -> 
            "-v";
        _ ->
            ""
    end,
    ?assertMatch({ok, _}, retest:sh("rebar get-deps " ++ Verbose,
                                 [{dir, "release-tarball"}])),
    ?assertMatch({ok, _}, retest:sh("rebar compile-deps " ++ Verbose,
                             [{dir, "release-tarball"}])),
    ?assertMatch({ok, _}, retest:sh("rebar cl comp generate",
                                 [{dir, "release-tarball"}])),
    ?assertMatch({ok, _}, retest:sh("rebar dist " ++ Verbose,
                                 [{dir, "release-tarball"}])),
    ?assertMatch({ok, _}, retest:sh("tar -zxf exemplar-1.2.3.tar.gz",
                                 [{dir, "release-tarball/dist"}])),
    ?assert(exists("exemplar/bin/exemplar")),
    ?assert(exists("exemplar/etc/app.config")),
    ?assert(exists("exemplar/releases/1.2.3/exemplar.rel")),
    ?assertMatch({ok, _}, retest:sh("rebar distclean " ++ Verbose,
                                 [{dir, "release-tarball"}])),
    ?assert(not exists("exemplar")),
    ok.

exists(F) ->
    filelib:is_regular(expected_file(F)).

expected_file(Path) ->
    filename:join("release-tarball/dist", Path).
