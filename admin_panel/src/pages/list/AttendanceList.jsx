import "./List.scss";
import Sidebar from "../../components/sidebar/Sidebar";
import Navbar from "../../components/navbar/Navbar";
import AllAttendance from "../../components/AllTables/AllAttendance";

const AttendanceList = () => {
 
  return (
    <div className="list">
      <Sidebar />
      <div className="listContainer">
        <Navbar />
        <AllAttendance />
      </div>
    </div>
  );
};

export default AttendanceList;  
