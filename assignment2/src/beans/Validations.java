package beans;


import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import org.hibernate.validator.constraints.Email;
import org.json.JSONArray;
import org.json.JSONObject;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class Validations {

	@Size(min=7,message="The length of Email address isMinimum 7 characters. ")
	//@Pattern(regexp="^\\\\w+((-\\\\w+)|(\\\\.\\\\w+))*\\\\@[A-Za-z0-9]+((\\\\.|-)[A-Za-z0-9]+)*\\\\.[A-Za-z0-9]+$",message="It is a not real email address style.")
	@Email
	private String email;
	
	@Pattern(regexp = "[0-9]{5}-[0-9]{4}",message="Your Zip code should follow this pattern: xxxxx-xxxx.")	
	private String zipcode;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	
	
	public Map<String, String> getLatitude(String address) {
		Map<String, String> map = null;
		try {
			URL resjson=new URL("https://maps.googleapis.com/maps/api/geocode/json?address="+ address +"&key=AIzaSyAOy92moGN3NC3G2M1VlfzM8DL0_qOIWi4");
			BufferedReader in = new BufferedReader(new InputStreamReader(resjson.openStream()));
			String res;
			StringBuilder sb  = new StringBuilder("");
			while ((res = in.readLine()) != null) {
				sb.append(res.trim());
			}
			in.close();
			String str = sb.toString();
			JSONObject obj = new JSONObject(str.toString()); 
			JSONArray objArray = obj.getJSONArray("results");
			String lat = null;
			String lng = null;
			if(objArray.length() != 0) {
				JSONObject location = objArray.getJSONObject(0).getJSONObject("geometry").getJSONObject("location");
				lat = Double.toString(location.getDouble("lat"));
				lng = Double.toString(location.getDouble("lng"));
			}else {
				lat = "null";
				lng = "null";
			}
			
			if (str != null) {
					map = new HashMap<String, String>();
					map.put("lng", lng);
					map.put("lat", lat);
					return map;
				}
		} catch (Exception e) {
			map.put("worryinfo", "Your address is worry!");
			
		}
		return map;
	}
	public Set<ConstraintViolation<Validations>> validateZipandEmail(String zipcode,String email, Validations v) {
		 ValidatorFactory vf = Validation.buildDefaultValidatorFactory();
		 
	        Validator validator = vf.getValidator(); 
	        v.setEmail(email);
	        v.setZipcode(zipcode);
	        Set<ConstraintViolation<Validations>> validate=validator.validate(v);
	        return validate;
	}
}
