viewportDim = do ->
    ret = [
        document.documentElement.clientWidth,
        document.documentElement.clientHeight
    ]
    ret.sort()
    ret


makeJumbotronResponsive = ->

    mainImage = document.querySelector('#main-image')

    if viewportDim[0] <= 768
        h = 768
        w = (2048 / 1365) * h
        mainImage.style.width = "#{w}px"
        mainImage.parentElement.style.height = '768px'
        mainImage.style.position = 'absolute'
    else
        mainImage.style.width = '100%'
        mainImage.style.position = 'relative'


isMobile = ->
    agentRegExp = /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i
    !!(agentRegExp.test(navigator.userAgent))

makeJumbotronResponsive()