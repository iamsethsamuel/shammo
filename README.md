# Shammo

This is a package that contains many functions and components that developers typically need to build an app. These components ranges from functions that makes your code cleaner and shorter and widgets to make it easier to implement common widgets. Here is a list of some of the components and widgets to use.

# Utilities

These are the functions that provides functionalities that can be to used throughout an app. Here is the list of the functions.

## MediaQueries

You can access any media query by calling the last method in the chain. For example, to access

```dart
MediaQuery.of(context).size.height;
//use
height(context);

//Or to access the media query class itself
mediaQuery(context);
```

## Theme

You can use methods related to theme by calling the last method in the chain. For example, to access the bodyText1 method you can use

```dart
bodyText1(context);

//Instead of
Theme.of(context).textTheme.bodyText1;

//Or access the them itself with
theme(context)

//And text theme with
textTheme(context)

//Icon theme with
iconTheme(context)

//Colors with
cardColor(context)
canvasColor(context)
```

## Navigator

You can use methods related to navigation by calling the last method in the chain. For example, pop a route you can use

```dart
pop(context);

//Instead of
if(Navigator.maybeOf(context) != null && Navigator.of(context).mounted){
    if(Navigator.of(context).canPop()){
        Navigator.of(context).pop();
    }
}

//You can push a route with
push(context, HomePage())

//Instead of
if(Navigator.maybeOf(context) != null && Navigator.of(context).mounted){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>      HomePage()
    ))
}
```

By default, the router is set to adaptive. That means it use CupertinoPageRoute on iOS and macOS and MaterialPageRoute on any other platform. You can turn off this behavior this so

```dart
      push(context, HomePage(), adaptive: false);
```

## Other util functions

> -   **showSnackBar(context, "Hey there")**
> -   **openDialog(context,Text("Delete") Text("Are you sure you want to deleted?"),actions:[ElevatedButton(child: Text("Yes"),),ElevatedButton(child: Text("No"),)])**
> -   **closeDialog(context)**
> -   **removeSnackbar(context)**
> -   **generateColor("text", "#ffe")**
> -   **getTheme(context).cardColor**
> -   **getMedia(context).padding**
> -   **commaSeperatedNumber(100000)**
> -   **toDouble(number)**
> -   **toInt(number)**
> -   **copy(context, text)**
> -   **convertToColor("#fes")**
> -   **getColorCode("1d34a1")**
> -   **confirmAction(context, confirm: "Delete",onConfirm: ()=>list.removeAt(0)))**
> -   **showSnackBar(context, "Done")**
> -   **percentageCalculator(14023, 20)**

## Components

> -   ### Badge
>     This is used to create a Badge
>     ```dart
>      Badge(child: Icon(Icons.bell, badge: Text("10+"), badgeColor: Colors.red)
>     ```
> -   ### ContainerButton
>     This it used to create a component that has a that is entirely clickable with an Icon on at the end.
>     ```dart
>     ContainerButton(body: Text("Click"), action: IconButton(icon: Icon(Icons.add)))
>     ```
> -   ### PostCard
>     This is a Widget this is used to create a Card that can be used to Posts
>     ```dart
>      PostCard(title: Text("Seth's Post"), action: IconButton(icon: Icon(Icons.more_vert)), content:Text("Seth is awesome"), avatar: CircleAvatar(backgroundImage: NetworkImage("https://seth.com/dp"),),actions:[IconButton(icon:Icons.thumb_up), IconButton(icon:Icons.comment)])
>     ```
> -   ### Carousel
>     This is used to create beautiful Carousels
>     ```dart
>     Carousel(onTap: (){},aspectRatio: 16/8,items:[Image.asset("assest/images/img.png"),Image.asset("assest/images/img1.png", Image.asset("assest/images/img2.png"], )
>     ```
> -   ### MaterialRadio
>     This is used to create a Radio button.
>     ```dart
>     MaterialRadio(color: Colors.blue, onChange: (){})
>     ```
> -   ### CountDown
>     This is used to create count downs in seconds
>     ```dart
>     CountDown(duration: 60)
>     ```
> -   ### MenuButton
>     This is used to create a Button that has a leading and trailing Icon
>     ```dart
>     MenuButton(header: Text("Scan QR Code"), description:Text("Use this to Scan QRCodes", route:QRCodePage(),Icons.qrcode))
>     ```
> -   ### CustomTextField
>     This is used to easily create TextFields
>     ```dart
>      CustomTextField(label: Text("Name"),hint: "First name", border: OutlineInputBorder())
>     ```
> -   ### MaterialCard
>     This creates a widget create a MaterialCard. You can add an avatar, title, subheader etc
>     ```dart
>      MaterialCard(title: Text("Name"), avatar: Image.network(url), decoration: BoxDecoration(color: Colors.white), content: Carousel(onTap: (){},aspectRatio: 16/8,items:[Image.asset("assest/images/img.png"),Image.asset("assest/images/img1.png", Image.asset("assest/images/img2.png"], ))
>     ```

## Follow

-   Twitter [@iamsethsamuel](https://twitter.com/iamsethsamuel)
-   GitHub [iamsethsamuel](https://github.com/iamsethsamuel)
-   LinkedIn [Seth Samuel](https://www.linkedin.com/in/seth-samuel-300979200)
