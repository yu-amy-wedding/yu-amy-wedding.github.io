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
            vm.errorMessages = []
            return

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
                vm.errorMessages = []

                if vm.hasChildSeatCountError = hasChildSeatCountError
                    target = 'child-seat-form-group'
                    vm.errorMessages.push '兒童座椅個數怎麼比出席人數還多？'

                if vm.hasAttendeeCountError = hasAttendeeCountError
                    target = 'attendee-form-group'
                    vm.errorMessages.push '沒有填出席人數喔'

                if vm.hasNameError = hasNameError
                    target = 'name-form-group'
                    vm.errorMessages.push '這位英雄你的大名咧？'

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

        vm.checkInteger = (val) ->

            parsed = parseInt(val, 10) || 0
            parsed = 0 if parsed < 0
            parsed

        vm.init()
