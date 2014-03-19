lab3
====


Alex Leaf


Code Critique
Bad Code 1

![alt text](http://i60.tinypic.com/4vh4xh.png)

The Code does not definitively set a default when there is not one of the cases

Fix

![alt text](http://i60.tinypic.com/ojgm68.png)

By saying "when others" we ensure thatt he value is always set

Bad Code 2

![alt text](http://i60.tinypic.com/qqs74z.png)

same as above, it does not definitely set the value when it is not one of the specified cases

Fix

![alt text](http://i58.tinypic.com/33xzv9x.png)

By saying "when others", it is ensured that the value will always be set


Bad Code 3

![alt text](http://i62.tinypic.com/xq01s9.png)

the nibbles are not set to anything

Fix

![alt text](http://i57.tinypic.com/6hkbnq.png)

to fix the problem, the nibbles i did not use are set to a generic value.


Documentation:
C3C Austin Bolinger explained how I needed to create a signal to handle two digit floor numbers.  C3C Thompson tried explaining to me how to implement the floors by using switches in the nexys board and showed me hwo to do the "if " statement for making the elevator go up or down.
