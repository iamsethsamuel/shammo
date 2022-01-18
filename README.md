# Shammo

This is a package that contains many components that developers typically need to build an app. These components ranges from methods and widgets. Here is a comprehensive.

## Components
> - ### Badge 
>   This is used to create a Badge 
>   ```dart
>    Badge(child: Icon(Icons.bell, badge: Text("10+"), badgeColor: Colors.red)
>    ```
> - ### ContainerButton
>   This it used to create a component that has a that is entirely clickable with an Icon on at the end. 
>   ```dart 
>   ContainerButton(body: Text("Click"), action: IconButton(icon: Icon(Icons.add)))
>    ```
> - ### PostCard
>   This is a Widget this is used to create a Card that can be used to Posts
>   ```dart
>    PostCard(title: Text("Seth's Post"), action: IconButton(icon: Icon(Icons.more_vert)), content:Text("Seth is awesome"), avatar: CircleAvatar(backgroundImage: NetworkImage("https://seth.com/dp"),),actions:[IconButton(icon:Icons.thumb_up), IconButton(icon:Icons.comment)])
>    ```
> - ### Carousel
>   This is used to create beautiful Carousels
>   ```dart
>   Carousel(onTap: (){},aspectRatio: 16/8,items:[Image.asset("assest/images/img.png"),Image.asset("assest/images/img1.png", Image.asset("assest/images/img2.png"], )
>   ```
> - ### MaterialRadio
>   This is used to create a Radio button.
>   ```dart
>   MaterialRadio(color: Colors.blue, onChange: (){})
>   ```
> - ### CountDown
>   This is used to create count downs in seconds
>   ```dart
>   CountDown(duration: 60)
>   ```
> - ### MenuButton
>   This is used to create a Button that has a leading and trailing Icon
>   ```dart
>   MenuButton(header: Text("Scan QR Code"), description:Text("Use this to Scan QRCodes", route:QRCodePage(),Icons.qrcode))
>   ```
> - ### CustomTextField
>   This is used to easily create TextFields 
>   ```dart
>    CustomTextField(label: Text("Name"),hint: "First name", border: OutlineInputBorder())
>   ```
> - ### MaterialCard
>   This creates a widget create a MaterialCard. You can add an avatar, title, subheader etc 
>   ```dart
>    MaterialCard(title: Text("Name"), avatar: Image.network(url), decoration: BoxDecoration(color: Colors.white), content: Carousel(onTap: (){},aspectRatio: 16/8,items:[Image.asset("assest/images/img.png"),Image.asset("assest/images/img1.png", Image.asset("assest/images/img2.png"], ))
>   ```

## Utilities
These are the functions that provides functionalities that can to used throughout an app. Here is the list of the functions.

> - **width(context)**
> - **height(context)**
> - **canvasColor(context)**
> - **cardColor(context)**
> - **push(context, HomePage())**
> - **pushReplacement(context, ProductPage())**
> - **pop(context)**
> - **showSnackBar(context, "Hey there")**
> - **openDialog(context,Text("Delete") Text("Are you sure you want to deleted?"),actions:[ElevatedButton(child: Text("Yes"),),ElevatedButton(child: Text("No"),)])**
> - **closeDialog(context)**
> - **postRequest(context, "https://post.com",jsonEncode({"data":"Hello"}))**
> - **getRequest(context,"https://get.com")**
> - **removeSnackbar(context)**
> - **generateColor("text", "#ffe")**
> - **getTheme(context).cardColor**
> - **getMedia(context).padding**

## Contributing
Send your GitHub user name to sethsamuel03@gmail.com

## Follow
- Twitter @iamsethsamuel
- GitHub https://github.com/iamsethsamuel
- 
