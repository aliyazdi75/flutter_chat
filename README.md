[![GitHub Repository Stars](https://img.shields.io/github/stars/aliyazdi75/flutter_chat?style=social)](https://github.com/aliyazdi75/flutter_chat/stargazers/)
[![GitHub Forks](https://img.shields.io/github/forks/aliyazdi75/flutter_chat?style=social&label=Fork)](https://github.com/aliyazdi75/flutter_chat/network/)
[![GitHub Watchers](https://img.shields.io/github/watchers/aliyazdi75/flutter_chat?label=Watch&style=social)](https://GitHub.com/aliyazdi75/flutter_chat/watchers/)
[![Twitter](https://img.shields.io/twitter/url/http/shields.io.svg?style=social)](https://twitter.com/intent/tweet?text=Wow:&url=https%3A%2F%2Fgithub.com%2Faliyazdi75%2Fflutter_chat)
[![Discord](https://img.shields.io/discord/848446475147280414.svg?label=&logo=discord&logoColor=ffffff&color=7389D8&labelColor=6A7EC2)](https://discord.gg/WvzYXxPcx3)

# flutter_chat

A full-featured (simple message, voice, video) flutter chat application
by SignalR and WebRTC.

![Flutter Chat Demo](./screenshots/demo.gif)

## Features

- Full Authentication service
- Bad request models and authentication validation from server (e.g.
  email, password, user exists)
- Storing authentication token
- On demand log-out (e.g. an unauthorized request)
- Chat list
- Chat page and simple chatting
- Communication between chat list and page Bloc
- Call Bloc which is responsible for before starting a call
- Full webRTC handshaking through SignalR (Offer, Answer, Candidate,
  HangUp, Reject)
- Camera and microphone functionality (e.g. switching camera, toggling
  camera and microphone and torch)
- All webRTC functionality are based on Bloc and suitable states and
  events
- All services communicate with their own providers
- All Blocs communicate with services through their repositories

## FAQs
- This application uses a free STUN and TURN server from
  [here](https://numb.viagenie.ca/) which just works well on local
  network. Please mention good STUN and TURN servers in the issue.
- The server source code is not open-source, but I will ask them to
  provide an open-source simple chatting. If you have time to make the
  server code with a simple user chatting and a simple socket handling,
  I will be delighted to integrate with the Flutter Chat.

## Discussion
Do you have any questions related to architectures and features, don't
hesitate to make your first
[discussion](https://github.com/aliyazdi75/flutter_chat/discussions/new) and
join my [Discord](https://discord.gg/y4RcnyK5uT) server.

## Support
Have an idea? [PRs](https://github.com/aliyazdi75/flutter_chat/fork) and
[issues](https://github.com/aliyazdi75/flutter_chat/issues/new/choose) are
most welcome.

Got no time? If you found my project and articles helpful,
[Share](https://twitter.com/intent/tweet?text=Wow:&url=https%3A%2F%2Fgithub.com%2Faliyazdi75%2Fflutter_chat)
and Star.

[![Stargazers over time](https://starchart.cc/aliyazdi75/flutter_chat.svg)](https://starchart.cc/aliyazdi75/flutter_chat)
