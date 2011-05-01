%% -----------------------------------------------------------------------------
%%
%% Rebar Dist Plugin
%%
%% Copyright (c) 2011 Tim Watson (watson.timothy@gmail.com)
%%
%% Permission is hereby granted, free of charge, to any person obtaining a copy
%% of this software and associated documentation files (the "Software"), to deal
%% in the Software without restriction, including without limitation the rights
%% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
%% copies of the Software, and to permit persons to whom the Software is
%% furnished to do so, subject to the following conditions:
%%
%% The above copyright notice and this permission notice shall be included in
%% all copies or substantial portions of the Software.
%%
%% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
%% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
%% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
%% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
%% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
%% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
%% THE SOFTWARE.
%% -----------------------------------------------------------------------------
%% @author Tim Watson [http://hyperthunk.wordpress.com]
%% @copyright (c) Tim Watson, 2011
%% @since: April 2011
%%
%% @doc Rebar Dist Plugin. 
%%
%% -----------------------------------------------------------------------------
-module(rebar_dist_plugin).

-export([dist/2, distclean/2]).

-export([generate/2, clean/2]).

generate(Config, _) ->
    rebar_log:log(debug, "Dist Plugin `generate' ~p~n", [Config]),
    ok.

dist(Config, Thing) ->
    rebar_log:log(debug, "Dist Plugin `dist' ~p:~p~n", [Thing, Config]),
    ok.

distclean(Config, _) ->
    rebar_log:log(debug, "Dist Plugin `distclean' ~p~n", [Config]),
    ok.

clean(Config, _) ->
    rebar_log:log(debug, "Dist Plugin `clean' ~p~n", [Config]),
    ok.
