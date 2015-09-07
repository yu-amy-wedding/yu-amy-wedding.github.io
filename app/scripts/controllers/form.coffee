angular
    .module 'yuAmyWeddinggithubioApp'
    .controller 'FormCtrl', ($timeout, $anchorScroll, $window) ->
        vm = @

        WILL_ATTEND = 'yes'
        NOT_ATTEND_BUT = 'no but has gift'
        NOT_ATTEND = 'no'

        YU_FREIND = 'Yu'
        AMY_FREIND = 'Amy'
        BOTH_FRIEND = 'Both'

        vm.init = ->

            vm.name = ''
            vm.phone = ''
            vm.mayAttend = WILL_ATTEND
            vm.carnivoreCount = 0
            vm.vegetarianCount = 0
            vm.childSeatCount = 0
            vm.email = ''
            vm.address = ''
            vm.friendOf = YU_FREIND
            vm.blessing = ''
            vm.hasNameError = false
            vm.hasAttendeeCountError = false
            vm.hasChildSeatCountError = false

        vm.willAttend = ->

            vm.mayAttend is WILL_ATTEND

        vm.getAttendeeCount = ->

            vm.carnivoreCount + vm.vegetarianCount

        vm.beforeSubmitForm = ->

            hasNameError = vm.name.length is 0
            hasAttendeeCountError =
                vm.willAttend() and vm.getAttendeeCount() is 0
            hasChildSeatCountError =
                vm.willAttend() and (vm.childSeatCount > vm.getAttendeeCount())

            $timeout ->

                target = null

                if vm.hasChildSeatCountError = hasChildSeatCountError
                    target = 'child-seat-form-group'

                if vm.hasAttendeeCountError = hasAttendeeCountError
                    target = 'attendee-form-group'

                if vm.hasNameError = hasNameError
                    target = 'name-form-group'

                if target
                    $anchorScroll(target)

            !hasNameError && !hasAttendeeCountError && !hasChildSeatCountError

        vm.onAttendStatusChanged = ->

            unless vm.mayAttend is WILL_ATTEND
                vm.carnivoreCount = vm.vegetarianCount = vm.childSeatCount = 0

        vm.onSubmitForm = (content) ->

            $window.alert('感謝你的回覆，你的心意我們收到了')

        vm.onSubmitFormError = (error) ->

            vm.onSubmitForm()

        vm.init()