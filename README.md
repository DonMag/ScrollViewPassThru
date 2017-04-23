# ScrollViewPassThru

Examples of allowing touches on part of a UIView to "pass thru" to an underlying view.

 - Overlapping ScrollViews
   - Shows a Vertical ScrollView overlapping a Horizontal ScrollView. Touches in the top "empty" portion of the Vertical Scroll "Pass Thru" to the underlying Horizontal ScrollView.

 - UIView Overlay on ScrollView
   - Show a UIView overlaid on top of a UIScrollView. Touches on the UIView "Pass Thru" to the underlying ScrollView, but only if they do NOT touch subviews of the Overlay view.
