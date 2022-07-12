#  Introduction

While developing an application at work, I started to think about the importance of the app informing the user about problems with the internet connection, especially on some screens. So, I developed an easy-to-reuse widget that shows a personalized message that the user is disconnected from the internet, replacing the app's original screen.

# Basic Usage

The usage is pretty simple, just wrap the parent widget of the entire screen you want to overlay with InternetBuilderWidget. Once this is done, all screen content will be replaced when the user is disconnected from the internet.

```dart
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        body: const InternetBuilderWidget
        (
          showWhenDisconnected: Center(
            child: Text('Disconnected'),
          ),
          showWhenConnected: Center(
            child: Text('Hello World'),
          ),
        ),
      ),
    );
  }
}
```

This simple step will already configure the widget for use.

*Note 1: If your entire app has a single widget as a parent (Scaffold or MaterialApp for example), just wrap it in the InternetBuilderWidget and the functionality will be spread to the rest of the app. You can test this behavior to the relevant. the Scaffold in the example code with the InternetBuilderWidget. However, care must be taken not to end up hiding important components, such as the Appbar of a Scaffold.

*Note 2: If you need more control or performance, there is a package code made with dependency injection as Singletons in the project repository, in the modular_internet_builder branch.

*Note 3: When using emulators, assure that both wifi and mobile data are disabled to trigger the disconnection.

![enter image description here](https://media.giphy.com/media/IgGXIvgUtHNjWlWFQm/giphy.gif)

## Todo

- [ ] Improve Tests
- [ ] OnError Callback      

## Suggestions & Bugs

For any suggestions or bug report please head to [issue tracker][tracker].

[tracker]: https://github.com/Greismorr/internet_connection_checker/issues