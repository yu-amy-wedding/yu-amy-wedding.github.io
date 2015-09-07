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
        mainImage.style.height = '768px'
    else
        mainImage.style.width = '100%'


isMobile = ->
    agentRegExp = /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i
    !!(agentRegExp.test(navigator.userAgent))
