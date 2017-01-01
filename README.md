Monero
======

Run the following command to show available arguments:

    docker run --rm erlend/monero

## Example

The following example will keep monero's data in `/some/path` and will run a
node in the testnet.

    docker run -i -v /some/path:/home/monero erlend/monero --testnet

*monerod exits immediately unless it is given a interactive terminal (docker's
`-i` argument).*
