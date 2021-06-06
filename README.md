# `SwiftUI` Learn
Welcome to my cookbook with awesome Views and studies all developed in SwiftUI.

If you have liked the content drop a star ⭐️, more SwiftUI code to come!

## Drag and drop game
This is a "game" drag a view and drop into another. The objective is to analyse how to use the drag gesture in SwiftUI and also to get the frame of a View and update a state while doing it.
The drag is mostly done with a `DragGesture` and updating the `offset` of a View.

### DragObjectView.swift
<img src="https://github.com/renefx/swiftui_learn/blob/main/images/DragDropGame.gif" width="250">

```
GradientCircle(colors: circleColors)
    .frame(width: 80)
    .overlay(
        geometryReader()
    )
    .overlay(
        Text("DRAG")
            .fontWeight(.black)
            .foregroundColor(.white))
    .offset(model.dragOffset)
    .gesture(
        DragGesture()
            .onChanged { gesture in
                model.dragOffset = gesture.translation
                calculateFrame = true
                if model.isAbove(model.objectFrame, model.targetFrame) {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        calculateFrame = false
                    }
                    model.won = true
                }
            }
            .onEnded { gesture in
                withAnimation(animation) {
                    model.dragOffset = .zero
                    calculateFrame = false
                }
            }
    )
```

## GeometryReader State Update loop

While developing the drag and drop game, I noticed a lack of information about the update of a `@State` inside a `GeometryReader`.
The `GeometryReader` is used to get the frame of a View.

Some people even saying that it was not possible. I went into the docs and noticed that it is possible. However, you might end up in an infinet loop.
To solve that you have to stop executing the `GeometryReader`.

The code for `GeometryReaderStateUpdate.swift` uses the solution for it.
For a detailed explanation, go at my StackOverflow answer.

[Go check it out!](https://stackoverflow.com/questions/61027327/set-state-var-inside-geometryreader/67855586#67855586)

### GeometryReaderStateUpdate.swift
<img src="https://github.com/renefx/swiftui_learn/blob/main/images/GeometryReader.png" width="250">

## Glassmorphism

A case study of the new UI trend. 
This is mostly done by adding layers of `ZStacks` or even working with the `zindex` of a View. 
In addition to that, to make things "glassy", you:

1 - add a white color with `opacity` to a View 
```
Color.white.opacity(0.6)
```

2 - ...or a Color with `blur`.
```
Circle()
  .background(
      Color.white.blur(radius: 30.0)
  )
```


<table>
<tr>
<td> 

<img src="https://github.com/renefx/swiftui_learn/blob/main/images/GlassmorphismII.png" width="250">

</td>
<td>

<img src="https://github.com/renefx/swiftui_learn/blob/main/images/Glassmorphism.gif" width="250">

</td>
</tr>
</table>


## Gradient Study

In this case study, on the left, I present the difference of using a `LinearGradient` vs using a `Color(.clear)` and then applying the `LinearGradient` as a background.

On the right I present a simple way to make awesome `Text` with a `LinearGradient`. 
The way to do it is to create an `overlay` and `mask` to the `View` itself. 
To make things easy, I created an extension for that.

```
extension View {
    public func gradientForeground(colors: [Color]) -> some View {
        self.overlay(LinearGradient(gradient: .init(colors: colors),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing))
            .mask(self)
    }
}
```

<table>
<tr>
<td> 
TransparentGradient.swift
</td> 
<td> 
ColoredText.swift
</td> 
</tr>
<tr>
<td> 

<img src="https://github.com/renefx/swiftui_learn/blob/main/images/GradientStudy.png" width="250">

</td>
<td>

<img src="https://github.com/renefx/swiftui_learn/blob/main/images/GradientStudyII.png" width="250">

</td>
</tr>
</table>
