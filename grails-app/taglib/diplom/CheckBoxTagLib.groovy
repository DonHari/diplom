package diplom

class CheckBoxTagLib {

    /**
     * @attr disabled REQUIRED Does checkbox disabled
     * @attr checked REQUIRED Does checkbox checked
     * @attr message REQUIRED
     * @attr id REQUIRED Checkbox id
     * @attr name REQUIRED checkbox name
     */
    def prepareCheckbox = { attrs, body ->
        StringBuilder sb = new StringBuilder()
        sb.append('<div class="custom-control custom-checkbox"><input type="checkbox" class="custom-control-input" id="')
        sb.append(attrs.id)
        sb.append('" ')
        if(attrs.disabled){
            sb.append('disabled="" ')
        }
        if(attrs.checked){
            sb.append('checked="" ')
        }
        sb.append('name="')
        sb.append(attrs.name)
        sb.append('"/><label class="custom-control-label" for="')
        sb.append(attrs.id)
        sb.append('">')
        sb.append(attrs.message)
        sb.append('</label></div>')
        out << sb.toString()
    }
}
