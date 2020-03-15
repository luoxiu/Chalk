# Chalk

<div>
<a href="https://travis-ci.org/luoxiu/Chalk">
  <img src="https://travis-ci.org/luoxiu/Chalk.svg?branch=master">
</a>
<a href="https://github.com/luoxiu/Chalk/releases">
  <img src="https://img.shields.io/github/tag/luoxiu/Chalk.svg">
</a>
<img src="https://img.shields.io/badge/platform-iOS%20%7C%20macOS%20%7C%20watchOS%20%7C%20tvOS%20%7C%20Linux-lightgrey.svg">
<img src="https://img.shields.io/github/license/luoxiu/Chalk.svg">
</div>
<br>
<br>
<div align="center">
    <img src="chalk.jpg">
    <br>
    <br>
    <strong>Expressive styling on terminal string.</strong>
</div>

## Highlights

- Expressive API
- 256/TrueColor support
- Ability to nest styles
- Auto downgrading to terminal color support level
- No extensions on `String`
- Built-in 100+ handpicked colors
- rgb & hsl & hsv & hex

## Usage

Chalk's API is very similar to [chalk](https://github.com/chalk/chalk) -- one of the most popular packages on npm, it's clean and focused.


```swift
print(Chalk.cyan.on("cyan"))  // `ck` is an alias to `chalk`

// chainable
print(ck.red.bgMagenta.bold.underline.on("red bgMagenta bild underline"))

// combine terminal string and normal string
print(ck.red.on("!") + "error" + ck.green.on("o"))

// custom foreground color and background color with 100+ handpicked colors
print(ck.fg(.coral).bg(.lightGreen).bold.on("hi"))

// rgb & hsl & hsv & hex support
print(ck.fg(.rgb(0, 92, 197)).bg(.hex(0xf6f8fa)).underline.on("meow"))

// nest
print(ck.bgYellow.on("begin" + ck.red.bold.on("important") + "end"))
print(ck.bgYellow.on("begin", ck.red.bold.on("important"), "end"))


// define your own delightful output
let warn = { (s: String) in
    print(ck.white.bgYellow.on(s))
}
let error = { (s: String) in
    print(ck.red.bold.on(s))
}

warn("this is a warning!")
error("something wrong!")
```

## Styles

### Modifiers

```swift
reset
bold
faint              // aka dim, not widely supported.
italic
underline
blink
reverse
conceal            // aka hidden, not widely supported.
crossedOut         // aka strikethrough, not widely supported.
```

### Colors

#### Ansi16

```swift
// with `bg` prefix will set background color

black
red
green
yellow
blue
magenta
cyan
white

blackBright
redBright
greenBright
yellowBright
blueBright
magentaBright
cyanBright
whiteBright
```

#### 256/TrueColoe

```swift
ck.fg(.rgb(0, 100, 200))
ck.fg(.hsl(300, 50, 50))
ck.fg(.hsv(300, 50, 50))
ck.bg(.hex(0x123456))
ck.bg(.hex("#abc")
ck.bg(.hex("#123456")
```

#### 100+ handpicked colors

```swift
ck.fg(.peachpuff)
ck.fg(.plum)
ck.bg(.coral)
ck.bg(.fuchsia)
//...
```

## Install

```swift
dependencies: [
    .package(url: "https://github.com/luoxiu/Chalk", .upToNextMajor(from: "0.0.1"))
]
```


## Acknowledge

Inspired by the awesome javascript library [chalk](https://github.com/chalk/chalk).

## Related

- [Rainbow](https://github.com/luoxiu/Rainbow) - 🌈 Color conversion and manipulation library for Swift with no dependence on UIKit/AppKit.

## Contribute

If you find a bug, open an issue, if you want to add new features, feel free to submit a pull request. Any contributing is welcome at all times!
