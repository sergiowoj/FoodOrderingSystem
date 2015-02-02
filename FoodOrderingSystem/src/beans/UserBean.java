package beans;

public class UserBean
{
    private String uid;         //Username
    private String password;    //Password    
    private String firstName;   //First Name
    private String lastName;    //Last Name
    private String address1;    //Address 1
    private String address2;    //Address 2
    private String city;        //City or Town
    private String postCode;    //Post Code
    private String email;       //Email
    private int phone;    		//Phone number
    private String userGroup;   //User group

    public UserBean() {}

    public void setUid(String str) { uid = str; }
    public String getUid() { return uid;}

    public void setPassword(String str) { password = str; }
    public String getPassword() { return password;}    

    public void setFirstName(String str) { firstName = str; }
    public String getFirstName() { return firstName; }

    public void setLastName(String str) { lastName = str; }
    public String getLastName() { return lastName; }

    public void setAddress1(String str) { address1 = str; }
    public String getAddress1() { return address1; }

    public void setAddress2(String str) { address2 = str; }
    public String getAddress2() { return address2; }

    public void setCity(String str){ city = str; }
    public String getCity() { return city; }

    public void setPostCode(String str){ postCode = str; }
    public String getPostCode() { return postCode; }
    
    public void setEmail(String str){ email = str; }
    public String getEmail() { return email; }

    public void setPhone(int num) { phone = num;}
    public int getPhone() { return phone; }
    
    public void setUserGroup(String str) { userGroup = str; }
    public String getUserGroup() { return userGroup; }
}