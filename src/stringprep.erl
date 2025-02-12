%%%----------------------------------------------------------------------
%%% File    : stringprep.erl
%%% Author  : Alexey Shchepin <alexey@process-one.net>
%%% Purpose : Interface to stringprep
%%% Created : 16 Feb 2003 by Alexey Shchepin <alexey@proces-one.net>
%%%
%%%
%%% Copyright (C) 2002-2021 ProcessOne, SARL. All Rights Reserved.
%%%
%%% Licensed under the Apache License, Version 2.0 (the "License");
%%% you may not use this file except in compliance with the License.
%%% You may obtain a copy of the License at
%%%
%%%     http://www.apache.org/licenses/LICENSE-2.0
%%%
%%% Unless required by applicable law or agreed to in writing, software
%%% distributed under the License is distributed on an "AS IS" BASIS,
%%% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%%% See the License for the specific language governing permissions and
%%% limitations under the License.
%%%
%%%----------------------------------------------------------------------

-module(stringprep).
-on_load(load_nif/0).
-nifs([tolower/1, tolower_nofilter/1, nameprep/1, nodeprep/1, resourceprep/1]).

-author('alexey@process-one.net').

-export([start/0, tolower/1, nameprep/1,
         nodeprep/1, resourceprep/1, tolower_nofilter/1]).

%%%===================================================================
%%% API functions
%%%===================================================================
start() ->
    case application:ensure_all_started(stringprep) of
        {ok, _} -> ok;
        Er -> Er
    end.

load_nif() ->
    SOPath = p1_nif_utils:get_so_path(?MODULE, [stringprep], "stringprep"),
    case catch erlang:load_nif(SOPath, 0) of
        ok -> ok;
        {error, {reload, _}} -> ok;
        Err -> error_logger:warning_msg("unable to load stringprep NIF: ~p~n", [Err]),
               {error, unable_to_load_nif}
    end.

-spec tolower(iodata()) -> binary() | error.
tolower(_String) ->
    erlang:nif_error(nif_not_loaded).

-spec tolower_nofilter(iodata()) -> binary() | error.
tolower_nofilter(_String) ->
    erlang:nif_error(nif_not_loaded).

-spec nameprep(iodata()) -> binary() | error.
nameprep(_String) ->
    erlang:nif_error(nif_not_loaded).

-spec nodeprep(iodata()) -> binary() | error.
nodeprep(_String) ->
    erlang:nif_error(nif_not_loaded).

-spec resourceprep(iodata()) -> binary() | error.
resourceprep(_String) ->
    erlang:nif_error(nif_not_loaded).
