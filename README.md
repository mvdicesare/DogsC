#  Dog

Students will build an app to access different information and photos of Breeds of Dogs. This app will help students practice and solidify the following concepts in Objective-C:
*Table Views
*Collection Views
*REST API calls

Please note and be aware that parts of these instructions are intentionally vague as this is Unit 4, and you have accrued a lot of experience thus far. A decent portion of this app is fairly simple, and you have done these things much time (Table Views, model objects, etc.), simply not in Objective-C. Remember the 20-minute rule, and try Googling, looking at Stack Overflow, and use the documentation before you ask a mentor. This is for your own benefit to help you acquire the skills to find solutions independently.

## Part One - Model Objects and Dog Client

Take the time to look through the documentation for the API [here](https://dog.ceo/api). It will be essential that you can navigate and know how to find the information needed from the API throughout the project, again as the instructions are intentionally vague.

Use what you learned from exploring the documentation to make various sample requests through a web browser or HTTP Client (e.g. Postman or Paw). The following endpoints may be helpful in searching the API.

*The Base API URL (returns no data on it's own): [https://dog.ceo/api](https://dog.ceo/api)
*The list of Dog Breeds and Sub-Breeds: [https://dog.ceo/api/breeds/list/all](https://dog.ceo/api/breeds/list/all)
*The list of images for a selected Breed [Example](https://dog.ceo/api/breed/hound/images)
The list of images for a selected Sub-Breed [Example](https://dog.ceo/api/breed/hound/basset/images)
*Image URL [example](https://images.dog.ceo/breeds/hound-afghan/n02088094_1430.jpg)

Each of these endpoints will provide you with the basis of one of your model objects. Each will require it's own fetch functions. You should familiarize yourself with the structure of the json of each query.

#### Model Objects:
You will need two model objects in this project. A model representing a dog breed and a dog sub-breed.

Create a new Cocoa Touch sublcess of `NSObject` for each of these two model objects.

*Add properties for the following model objects. Use the json trees above to determins the type of each property. Assume all properties should be nonatomic and readonly:

* **Breed**:
* Name
* An Array of Sub-Breeds
* An Array of Image URLs

* **SubBreed**:
* Name
* An Array of Image URLs

* Think about where we're getting the data from, and create an appropriate initializer for each model object.   *Hint: Everything returned in JSON is contained in an Array or a __Dictionary__. You will need to reference the JSON for each model's respective endpoint heavily to create these initializers.

### Breed Network Client

Create a new Cocoa Touch subclass of  `NSObject` called `BreedNetworkClient` with a three letter prefix at the start. This will be where we make the network calls to get the JSON from the Dog Api.

### BreedNetworkClient.h
In the header file, create four instance method signatures:

1.  `fetchAllBreeds` has a completion block as a parameter. It returns an array of Breeds.
2. `fetchBreedImageURLs` has a breed and a completion block as a parameter. It returns an Array of Image URLs as NSStrings.
3. `fetchSubBreedImageURLs` has a breed, subBreed, and a completion block as a parameter. It returns an Array of Image URLs as NSStrings.
4. `fetchImageData` has a NSURL and a completion block as a parameter that returns imageData in the form of NSData.

Create a shared instance as a private method.

### BreedNetworkClient.m
* Create a static constant NSString called baseURLString and set it as: "https://dog.ceo/api"

#### Instance methods:

You will now fill out the methods that you defined in the .h file. 
1.  `fetchAllBreeds` 
2. `fetchBreedImageURLs` 
3. `fetchSubBreedImageURLs` 
4. `fetchImageData` 

The following four methods will all use `NSURLSession`, and follow the same steps as in Swift to take a URL, get data from it, turn it into JSON, and then turn the JSON into our model objects. Since Objective-C does not have access to Swift's `Codable` protocol, we will need to follow the failable initializer method, using `[NSJSONSerialization JSONObjectWithData:]` to initialize a dictionary.  You will then need to call an initializer (which you should have written in each of your model objects) which takes in a dictionary (from the JSON) and returns an instance of the model.  Use the class methods we made above to generate the URLs necessary. Remember to look at what each method should return through the completion block for the end goal of the method.


## Part One - Storyboard and Table View Controllers

### Storyboard:
Implement the following view hierarchy in the Storyboard. As you create each scene in the storyboard, create the appropriate Cocoa Touch files for each scene. Follow standard file naming conventions.
* The project will have a `UITableViewController` as its initial View Controller embedded in a `UINavigationController`, with a basic cell. This will show a list of the Breeds.
* From the tableView, the project will go to either a new `UITableViewController` or a `UICollectionViewController`. Create both of these on the Storyboard. The new `UITableViewController` will be used to show Sub-Breeds of a selected breed, if they exist. The `UICollectionViewController` will show photos of the select Breed or Sub-Breed.
* From the initial `UITableViewController` create two segues. One to each of the new Controllers. This is done by making the connection from the Controller itself, not from the cell.
* Both the Breed `UITableViewController` and the Sub-Breed `UITableViewController` will use the basic cell to display the name of the Breed or Sub-Breed.
* The `UICollectionViewCell` will be custom and hold a single `UIImageView`.

If you haven't already, create Cocoa Touch Files for the views and view controllers you just made in the Storyboard.  Remember to subclass each of your storyboard View Controllers and Views with the proper CocoaTouchClass.

### BreedsListTableViewController
No other classes will reference properties or methods on the CRABreedsListTableViewController and therefore the .h file should be blank.

* In the implementation create a private array called `breeds` that will be the data source for the table view.
* In the `viewDidLoad` call the `fetchAllBreeds` method to fetch the Breeds available to display.
* Implement the `UITableViewDataSource` methods using the `breeds` array..
* Use the `didSelectRowAtIndexPath` method to determine which view controller is your destination.
* Use the `performSegueWithIdentifier:` method to select the view controller you sould like to segue to.
* Using the prepareForSegue method, pass the appropriate `Breed` object to the destination view controller. Make sure that the destination view controller has a **public** _(thing "landing pad")_ property that serves as a placeholder to put the information to.

### SubBreedsListTableViewController
* Implement the `UITableViewDataSource` methods. (hint: Use the passed Breed)
* Create a custom setter- `setBreed:` for the public breed property that checks if the breed being passed through the setter is the same as the current breed ( `_breed` ). If it isn't, then set the current breed to the one passed into the setter, and also reload the tableview. Remember that this setter is where we can do the Objective-C equivalent of a Swift `willSet` and `didSet`.
* In the prepareForSegue, you should pass two things to the destination view controller; the Breed that the SubBreedsListTableViewController got from the initial view controller's prepareForSegue, and the SubBreed from the cell that the user just tapped on. (Again, make sure to create public properties on the destination view controller to be placeholders for these two things- i.e. two separate "landing pads")

At this point, you should be able to run the app and be able to select a Breed with a SubBreed from the inital table view controller, and see a list of its SubBreeds. When selecting a Breed without SubBreeds or a SubBreed you should be brought to the Collection View Controller. Make sure this works before continuing.

## Part Two - Storyboard and Table View Controllers

### Storyboard:
Implement the following view hierarchy in the Storyboard. As you create each scene in the storyboard, create the appropriate Cocoa Touch files for each scene. Follow standard file naming conventions.
* The project will have a `UITableViewController` as its initial View Controller embedded in a `UINavigationController`, with a basic cell. This will show a list of the Breeds.
* From the tableView, the project will go to either a new `UITableViewController` or a `UICollectionViewController`. Create both of these on the Storyboard. The new `UITableViewController` will be used to show Sub-Breeds of a selected breed, if they exist. The `UICollectionViewController` will show photos of the select Breed or Sub-Breed.
* From the initial `UITableViewController` create two segues. One to each of the new Controllers. This is done by making the connection from the Controller itself, not from the cell.
* Both the Breed `UITableViewController` and the Sub-Breed `UITableViewController` will use the basic cell to display the name of the Breed or Sub-Breed.
* The `UICollectionViewCell` will be custom and hold a single `UIImageView`.

If you haven't already, create Cocoa Touch Files for the views and view controllers you just made in the Storyboard.  Remember to subclass each of your storyboard View Controllers and Views with the proper CocoaTouchClass.

### BreedsListTableViewController
No other classes will reference properties or methods on the CRABreedsListTableViewController and therefore the .h file should be blank.

* In the implementation create a private array called `breeds` that will be the data source for the table view.
* In the `viewDidLoad` call the `fetchAllBreeds` method to fetch the Breeds available to display.
* Implement the `UITableViewDataSource` methods using the `breeds` array..
* Use the `didSelectRowAtIndexPath` method to determine which view controller is your destination.
* Use the `performSegueWithIdentifier:` method to select the view controller you sould like to segue to.
* Using the prepareForSegue method, pass the appropriate `Breed` object to the destination view controller. Make sure that the destination view controller has a **public** _(thing "landing pad")_ property that serves as a placeholder to put the information to.

### SubBreedsListTableViewController
* Implement the `UITableViewDataSource` methods. (hint: Use the passed Breed)
* Create a custom setter- `setBreed:` for the public breed property that checks if the breed being passed through the setter is the same as the current breed ( `_breed` ). If it isn't, then set the current breed to the one passed into the setter, and also reload the tableview. Remember that this setter is where we can do the Objective-C equivalent of a Swift `willSet` and `didSet`.
* In the prepareForSegue, you should pass two things to the destination view controller; the Breed that the SubBreedsListTableViewController got from the initial view controller's prepareForSegue, and the SubBreed from the cell that the user just tapped on. (Again, make sure to create public properties on the destination view controller to be placeholders for these two things- i.e. two separate "landing pads")

At this point, you should be able to run the app and be able to select a Breed with a SubBreed from the inital table view controller, and see a list of its SubBreeds. When selecting a Breed without SubBreeds or a SubBreed you should be brought to the Collection View Controller. Make sure this works before continuing.

## Part Three: Collection View Controller and Collection View Cell

### ImageCollectionViewCell:
* Create the IBOutlet for the imageView
* Create a landing pad for an image NSURL
* In the implementation of the cell file, call the `prepareForReuse` function.
* Create a `setImageURL` method that uses the `fetchImageData` method from the `BreedNetworkClient`
* Set the image on the main thread.

### ImagesCollectionViewController:
* In the implementation create a private array called `imageURLs` that will be the data source for the collection view.
* Implement the `UICollectionViewDataSource` methods. (hint: Fetch the image URLs of the passed Breed or SubBreed)
* Create a custom setter- `setImageURLs:`
* Pass the imageURL to the `UICollectionViewCell`

You should now be able to load an entire collection view of images of Breeds and SubBreeds.

## Contributions

Please refer to CONTRIBUTING.md.

## Copyright

© DevMountain LLC, 2015. Unauthorized use and/or duplication of this material without express and written permission from DevMountain, LLC is strictly prohibited. Excerpts and links may be used, provided that full and clear credit is given to DevMountain with appropriate and specific direction to the original content.
