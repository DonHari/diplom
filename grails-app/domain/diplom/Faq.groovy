package diplom

class Faq {

    String question
    String answer
    Date dateCreated
    Date lastUpdated

    static belongsTo = [author: User]

    static constraints = {
        question blank: false
        answer blank: false
    }

    static mapping = {
        autoTimestamp true
        id generator: 'native',
                params: [sequence: 'faq_id_seq']
    }
}
