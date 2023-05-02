import "./AllTables.scss";
import { DataGrid } from "@mui/x-data-grid";
import { Link, Navigate } from "react-router-dom";
import axios from "axios";
import { useState, useEffect } from "react";

const AllAttendance = () => {
  // const [data, setData] = useState(userRows);
  const [getUserAttendaceDetails, setUserAttendanceDetails] = useState([]);

  useEffect(() => {
    getUsers();
  }, []);

  const getUsers = () => {
    axios
      .get("/api/attendace")
      .then((response) => response.data)
      .then((data) => {
        setUserAttendanceDetails(data.data.AllEmployeeAttendace);
      });
  };

  const handleDelete = (_id) => {
    axios.delete("/api/users/" + _id).then((response) => {
      if (response.data !== null) {
        setUserAttendanceDetails(getUserAttendaceDetails.filter((item) => item._id !== _id));
        //console.log(response.data.Users.username + "Record Delete Successful");
      }
    });
  };

  const handleView = (_id) => {
    window.localStorage.setItem("userSpecificId", _id);
  };

//   const actionColumn = [
//     {
//       field: "action",
//       headerName: "Action",
//       width: 200,
//       renderCell: (params) => {
//         return (
//           <div className="cellAction">
//             {/* <Link
//               to={"/attendance/" + params.row._id}
//               onClick={() => handleView(params.row._id)}
//               style={{ textDecoration: "none" }}
//             >
//               <div className="viewButton">View</div>
//             </Link> */}
//             <div
//               className="deleteButton"
//               onClick={() => handleDelete(params.row._id)}
//             >
//               Delete
//             </div>
//           </div>
//         );
//       },
//     },
//   ];

  return window.localStorage.getItem("token") ? (
    <div className="datatable">
      <div className="datatableTitle">
        Attendances
        {/* <Link to="newuser" className="link">
          Add New
        </Link> */}
      </div>
      <DataGrid
        className="datagrid"
        rows={getUserAttendaceDetails}
        columns={userColumns.concat()}
        pageSize={8}
        getRowId={(row) => row._id}
        rowsPerPageOptions={[8]}
        checkboxSelection
        onClick={getUsers}
      />
    </div>
  ) : (
    <Navigate to="/login" />
  );
};

export const userColumns = [
//   {
//     field: "user",
//     headerName: "User",
//     width: 100,
//     renderCell: (params) => {
//       return (
//         <div className="cellWithImg">
//           <img className="cellImg" src={params.row.img} alt="" />
//           {params.row.username}
//         </div>
//       );
//     },
//   },
  {
    field: "_id",
    headerName: "ID",
    width: 150,
  },
  {
    field: "EmployeeID",
    headerName: "Employee ID",
    width: 150,
  },
  {
    field: "EmployeeName",
    headerName: "Employee Name",
    width: 150,
  },
  {
    field: "Date",
    headerName: "Date",
    width: 200,
  },
  {
    field: "CheckIn",
    headerName: "Check-In",
    width: 200,
  },  {
    field: "CheckOut",
    headerName: "Check-Out",
    width: 200,
  },
];

export default AllAttendance;
