# Fast Stringprep implementation for Erlang / Elixir

Stringprep is a framework for preparing Unicode test strings in order
to increase the likelihood that string input and string comparison
work.

The principle are defined in [RFC-3454: Preparation of
Internationalized Strings ](http://tools.ietf.org/html/rfc3454).

This library is leverage Erlang native NIF mechanism to provide
extremely fast and efficient processing.

