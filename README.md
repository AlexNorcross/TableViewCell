# Table View Cell Appearance

Table views are great for many purposes. And we are all familiar with dequeueReusableCellWithIdentifier, which gives us a re-usable table view cell. However, I ran into a problem:

1. I wanted to set a cell's appearance - let's say change the color of the text - indicating that the cell was selected,
2. scroll down,
3. scroll back up, and
4. see the previously selected cell with the same appearance as I left it.

Hence, this bit of code.
