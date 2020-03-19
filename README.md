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
- Nest styles
- Auto downgrading to terminal supported color
- No extensions on `String`
- rgb & hsl & hsv & hex
- Built-in 100+ handpicked colors

## Usage

Chalk's API is very similar to [chalk](https://github.com/chalk/chalk) -- one of the most popular packages on npm.

```swift
print(chalk.cyan.on("cyan"))  // `ck` is an alias to `chalk`

// chainable
print(ck.red.bgBlue.italic.underline.on("red bgBlue italic underline"))

// combine terminal string and string
print(ck.red.on("ERROR") + " something went wrong. " + ck.green.on("but no worry! I will..."))

// rgb & hsl & hsv & hex support
print(ck.fg(.rgb(0, 92, 197)).bg(.hex(0xFA4B8B)).on("meow"))

// custom foreground color and background color with 100+ handpicked colors
print(ck.fg(.darkMagenta).bg(.lightGoldenRodYellow).bold.on("hi"))

// nest
print(ck.magenta.underline.on("begin" + ck.red.bold.on("important") + "end"))
print(ck.magenta.underline.on("begin", ck.red.bold.on("important"), "end"))
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
ck.bg(.hex("#123456")
ck.bg(.hex("#abc")
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
    .package(url: "https://github.com/luoxiu/Chalk", from: "0.0.1")
]
```


## Acknowledge

Inspired by the awesome javascript library [chalk](https://github.com/chalk/chalk).

## Related

- [Rainbow](https://github.com/luoxiu/Rainbow) - 🌈 Color conversion and manipulation library for Swift with no dependence on UIKit/AppKit.

## Contribute

If you find a bug, open an issue, if you want to add new features, feel free to submit a pull request. Any contributing is welcome at all times!
