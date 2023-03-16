/* eslint-disable*/


const deletess = async (id) => {
    //var pid = $(this).attr("value");
  
    try {
      const res = await axios({
        method: 'delete',
        url: `http://127.0.0.1:3000/api/v1/users/${id}`,
  
      });
  
      console.log(res);
      location.reload();
    } catch (err) {
      console.log(err.response.data);
    }
  
    };
  
    document.getElementById("deletebtn2").addEventListener("click", function() {
     console.log("hello");
      var id = document.getElementById("deleteid2").value;
      deletess(id);
    });

    $(document).on("click", ".deletep2", function() {
        var ide = $(this).attr("idPlayer");
        $(".modal-footer #deleteid2").val(ide);
        $(".modal-footer #deletebtn2").val(ide);
        });