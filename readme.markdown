# wintersmith-postcss

> [PostCSS](https://github.com/postcss/postcss) plugin for [Wintersmith](http://wintersmith.io/)

## Install

`npm install store-x --save`

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
  "plugins": [
    "./node_modules/postcss-import",
    "./node_modules/postcss-nested"
  ]
}
```
