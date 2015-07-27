# wintersmith-postcss

> [PostCSS](https://github.com/postcss/postcss) plugin for [Wintersmith](http://wintersmith.io/)

## Install

`npm install wintersmith-postcss --save`

## Usage

Add `wintersmith-postcss` to `config.json`:

```json
"plugins": [
  "./node_modules/wintersmith-postcss/plugin.coffee"
]
```

Also, in `config.json` you can configure `postcss`:

```json
"postcss": {
  "from": "contents/css/main.css",
  "plugins": [{
    "path": "./node_modules/postcss-nested"
  }, {
    "path": "./node_modules/postcss-import"
  }, {
    "path": "./node_modules/postcss-url",
    "autoexec": true,
    "params": {
      "url": "inline"
    }
  }, {
    "path": "./node_modules/cssnano",
    "autoexec": true
  }]
}
```
