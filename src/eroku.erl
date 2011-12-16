%%%-------------------------------------------------------------------
%% @copyright Geoff Cant
%% @author Geoff Cant <nem@erlang.geek.nz>
%% @version {@vsn}, {@date} {@time}
%% @doc Heroku convenience functions.
%% @end
%%%-------------------------------------------------------------------
-module(eroku).

%% API
-export([ http_listen_port/0
        ]).

%%====================================================================
%% API
%%====================================================================

-spec http_listen_port() -> inet:port_number().
http_listen_port() ->
    try erlang:list_to_integer(os:getenv("PORT")) of
        N when 0 =< N, N =< 65535 ->
            N
    catch
        error:badarg -> erlang:error({missing_env_var, "PORT"})
    end.

%%====================================================================
%% Internal functions
%%====================================================================
