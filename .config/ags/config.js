function Bar(monitor = 0) {
    const myLabel = Widget.Label({
        label: 'some example content',
    })

    Utils.interval(1000, () => {
        myLabel.label = Utils.exec('date')
    })

    return Widget.Window({
        monitor,
        name: `bar${monitor}`,
        anchor: ['top', 'left', 'right'],
        child: myLabel,
    })
}

App.config({
    windows: [
        Bar(0), // can be instantiated for each monitor
        Bar(1),
    ],
})
