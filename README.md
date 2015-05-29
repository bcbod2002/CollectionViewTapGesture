# CollectionViewTapGesture
Something strange with UICollectionView with UITapGesture

I create a collection view which could change flow layout when user double tap the collection view cell.

But there's something strange. In my project's situation.

I don't want users use their finger scroll collection view pages to watch others collection view cells.

I hope users could use button to change collection view pages to watch others collection view cells.

And I set collection view scroll disable use the function "setScrollEnable" with NO.

After set collection view scroll disable. 

Select the collection view cell become very and very slow.

It means when user select the collection view cell the function "didSelectItemAtIndexPath" will be called after 0.5 second ~ 1.0 second.

It's not like the function "setScrollEnable" with NO. The "didSelectItemAtIndexPath" will be called after user select the collection view cell.

There are two git animations when "setScrollEnable" with Yes and NO as follow:

setPagingEnabled = YES
//setScrollEnable = NO
![alt tag](https://github.com/bcbod2002/CollectionViewTapGesture/blob/master/Before.gif)


setScrollEnable = NO
//setPagingEnabled = YES
![alt tag](https://github.com/bcbod2002/CollectionViewTapGesture/blob/master/After.gif)

