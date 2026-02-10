package Model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor

public class AdminEvent {
 private int id;
 private String Name;
 private String EDate;
 private String Location;
 private String S_Email;
 private String S_Course;
 private String SCollege_name; 
 private int AdminId;

}
