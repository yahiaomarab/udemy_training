# appoo

Handling Api in a shopping project .

## Getting Started
The first thing to begin project the on boarding screen {
1/ PageView.builder we use it and its alist of model{image /text/text title}
2/so we make a list of model that accept model{image /text/text title}
3/item count =>list.length
4/item builder=>widget of build item that accept list of model 
5/ SmoothPageIndicator the number of pages that depend on controller 
6/the important thing that there is a method know the last page of boarding 
on changed (index)=>if(index=list.length-1)//you are know in the last
}
This project is a starting point for a Flutter application.
the second thing is the login page {
1/post data api and cache the token to reuse it 
2/the toqhel method to pass not a list but a bool variable
3/on pressed validate and formkey
}
the third thing is to toquel between boarding and login and home page{
if you have a token you may be in home page 
if you have boarding the bool value that fixed in cache you may be in login 
if else you dont have any thing you may be in on boarding screen 
and 2/the multiblocprovider that will be in main and you consume in 
any page you want but //////range the pages in main in muilti blocprovider
(//////an important information : if you want to reuse a method or an item builder and there is a 
different in one of them you may send an option not required bool variable and make a default is true 
and when a class is differ you send it false///////
)
}
the fourth thing when you send a model in shape{
1/if you want model from list as the same in boarding or from data you send it in models 
as the same in categories so you build item and send the place of data as a model
2/when you consume and make list view or any shape and reuse item you send amodel
of data and the best thing if it in models is to make an object and use it
3/the length from object ........
}
the fiveth is carousal slider {
1/ invent it to pupsbect .yamal 
2/its have an item: that take a map of widget so if you have alist convert it to map
3/carousal options .....CarouselOptions(
height: 250,
initialPage: 0,
reverse: false,
autoPlay: true,
viewportFraction: 1,
enableInfiniteScroll: true,
autoPlayInterval: Duration(
seconds: 3,
),
autoPlayAnimationDuration: Duration(seconds: 1),
autoPlayCurve: Curves.fastOutSlowIn,
scrollDirection: Axis.horizontal,
),
}
Girdview{GridView.count(
shrinkWrap: true,/////to scroll in all page 
physics: NeverScrollableScrollPhysics(),////to scroll in all page
crossAxisCount: 2,
mainAxisSpacing: 1,
crossAxisSpacing: 1,
childAspectRatio: 1/1.43,///to control width and height
children:
List.generate(
model.data.products!.length,
(index) => buildgridproduct(model.data.products![index],context),
),
toast {
1/enum{states }
2/method to use color in each state
3/future bool to make method toast 
4/in backcolor use a method of switch color
that take a state of enum
}


        

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.





THE API APPLICATION {
The first thing the change mode {
1/toqel between two thing so its a bool variable 
2/buy you want to cache the bool when you enter app 
so: 1/cache (put) in changemode 
2/cache (get) in main 
3/send that variable with open app and save it in bool (b)
but if you firstly open the app :
1/ send a bool(b) that if == null 
change mode 
2/if !=null bool(b)is the mode 
 
The second thing is to add at list{
1/build a widget that take a list 
.. take image and text for example
2/when you receve the list put a list you want to add at
.....but did you observe 
what did you add at this list to receve image and text 
i think i add from api 
dio.put .....
}

The third thing is the webview
{
1/from pakage 
2/send url 
3/when you button item by inkwell
....on tab nav to web and send url 
}

}
The third object is database
{
  from sqlflite flutter in GooGle
        you can get the information 

}