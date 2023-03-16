/* eslint-disable*/


const deletes = async (id) => {
    //var pid = $(this).attr("value");
  
    try {
      const res = await axios({
        method: 'delete',
        url: `http://127.0.0.1:3000/api/v1/players/${id}`,
  
      });
  
      console.log(res);
      location.reload();
    } catch (err) {
      console.log(err.response.data);
    }
  
    };
  
    document.getElementById("deletebtn").addEventListener("click", function() {
    //  console.log("hello");
      var id = document.getElementById("deleteid").value;
      deletes(id);
    });