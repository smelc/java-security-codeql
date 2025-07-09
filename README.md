# java-security-codeql

This repository is part of Tweag's experience sharing of using GitHub's
[CodeQL](https://codeql.github.com/) static analysis tool. Other resources of ours include:

* A variant of this repository using Python as the programming language of choice: [smelc/sarge-security-codeql](https://github.com/smelc/sarge-security-codeql)
* A technical blog post: [Getting started with CodeQL, GitHub's declarative static analyzer for security](LINK TBD)

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

## Catching the vulnerability with CodeQL

The query to catch the example vulnerability is in [queries/JoorMain.ql](./codeql-queries/JoorMain.ql). This query
relies on library code located in [queries/JoorLib.qll](./codeql-queries/JoorLib.qll). Debugging code, used
to find out how to write the main query is in [queries/Scratch.ql](./codeql-queries/Scratch.ql): this file
gives insight how one discovers what to write in a CodeQL query (the blog post linked above
explains this process in details).
