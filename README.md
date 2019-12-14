# odoo_json_rpc_flutter

Odoo Json-rpc Client for Flutter.

## Requirements

- Dart `>=2.7.0 <3.0.0`
- Flutter `>=1.12.13+hotfix.5 <2.0.0`

#### How to check `sdk` version

```
$ flutter doctor --verbose

[✓] Flutter (Channel stable, v1.12.13+hotfix.5, on Linux, locale en_IN)
    • Flutter version 1.12.13+hotfix.5 at /flutter/sdk/path
    • Framework revision 27321ebbad (3 days ago), 2019-12-10 18:15:01 -0800
    • Engine revision 2994f7e1e6
    • Dart version 2.7.0
```
#### How to set `sdk` version

- Go to `pubspec.yaml`
- Add following snippet
```yaml
environment:
  sdk: ">=2.7.0 <3.0.0"
  flutter: ">=1.12.13+hotfix.5 <2.0.0"
```