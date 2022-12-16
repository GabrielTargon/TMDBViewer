# TMDBViewer
iOS Application written in Swift with TMDB API

## First Steps

To make this app functional its necessary a API Key of TMDB API, [this link](https://developers.themoviedb.org/3/getting-started/authentication) has more instructions.

After getting a API you must change it on `Services/NetworkConsumer.swift`

## Requirements

- iOS 16+
- Xcode 14+
- Swift 5.0

## Tech info

- Clean swift
- UIKit (ViewCode)
- SwiftUI (Widget)
- TMBD API

## External packages (SPM)
- Kingfisher

## Improvements

- Compose
- Better error messages
- UnitTest

## Informations

The TMDBViewer app was created with the Clean Swift architecture because it's a type of architecture that is emerging and has been shown to be effective when it comes to scalability and organization. It's little more verbose than other types of architecture but when you are usually with it helps you to see easily where the things are (view, service call, business logic, etc)
