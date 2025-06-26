# java-security-codeql

## Install the development environment

We provide a [.envrc](./envrc) file to enter the development shell automatically.
You need both [direnv](https://direnv.net) and [Nix](https://nixos.org/) installed to use it.

Once you've entered the nix-shell, provision the Python dependencies as follows:

```shell
pip install -r dev-requirements.txt
```

## Triggering vulnerabilities

In one terminal, run:

```shell
./gradlew run
```

Trigger vulnerabilities in another terminal:

```shell
curl -X POST http://localhost:8080/api/invoke -d "method=sayHello"
```
