#  CurrencyExplorer

## Archtecture
This project was developed using Hexagonal Archtecture. A separated module was created to comport the logic, providing the necessary resources to the application. It was developed to work like a backend inside the app, leaving the main app to be responsible only for the presentation. 

- HexagonArchtecture: It has the business layer. All the hard work is solved by this module.
- HexagonEdges: It defines the models and ports(interface) provided by HexagonArchtecture module. The app don't have a deep knowledge about the archtecture, and use this ports to comunicate the the module.
- App: This is the application layer. The app layer works receiving users interactions and presenting data. All external communications access to files or networking are made by the HexagonArchtecture module. Actually the app is layer is all made in MVC, using Model as the only bridge to access HexagonArchtecture module. 




