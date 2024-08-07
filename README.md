<a name="readme-top"></a>

<div align="center">
    <a href="https://github.com/mshaugh/dnscontrol-action">
        <img src="https://raw.githubusercontent.com/twitter/twemoji/master/assets/svg/1f310.svg" alt="🌐" width="80" height="80">
    </a>
</div>

<h1 align="center">DNSControl Docker Action</h1>

> Maintain your DNS data with DNSControl and GitHub Actions.

![CI](https://img.shields.io/github/actions/workflow/status/mshaugh/dnscontrol-action/ci.yml?branch=main&style=flat-square&label=CI)

## Usage

```yaml
- uses: mshaugh/dnscontrol-action@v4
  with:
    # DNSControl command to run.
    # Usually one of `check`, `preview`, or `push`.
    args: ""

    # Relative path under $GITHUB_WORKSPACE to the file containing your
    # DNS config in javascript DSL.
    # Default dnsconfig.js
    config_file: ""

    # Relative path under $GITHUB_WORKSPACE to the file containing your
    # provider credentials.
    # Default: creds.json
    creds_file: ""
```

## License

Distributed under the [ISC License](./LICENSE). See [`LICENSE`](./LICENSE) for more information.

## Acknowledgements

- [koenrh/dnscontrol-action](https://github.com/koenrh/dnscontrol-action)
