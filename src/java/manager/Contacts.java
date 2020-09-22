package manager;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class Contacts {
    int inc = 0;
    Map<Integer, ArrayList<String>> contacts = new HashMap<Integer, ArrayList<String>>();
    
    public Contacts(){
        
    }
    
    public void addContact(String nome, String telefone, String email){
        ArrayList<String> contact = new ArrayList();
        
        contact.add(nome);
        contact.add(telefone);
        contact.add(email);
        
        this.contacts.put(this.inc, contact);
        this.inc++;
    }
     
    public Map<Integer, ArrayList<String>> getContacts(){
        return this.contacts;
    }
}
