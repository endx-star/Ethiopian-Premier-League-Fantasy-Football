/* eslint-disable*/

 const logan = async (name, clubId, price, position, photo) => {
    try {
        const res = await axios({
          method: 'POST',
          url: 'http://127.0.0.1:3000/api/v1/players',
          data: {
            name,
            clubId,
            price,
            position,
            photo

          }
        });
        location.reload();
        console.log(res);
      } catch (err) {
        console.log(err.response.data);
      }
  };

document.querySelector('.form').addEventListener('submit', e => {
    e.preventDefault();
    const name = document.getElementById('name').value;
    const clubId = document.getElementById('clubId').value;
    const photo = document.getElementById('photo').value;
    const price = document.getElementById('price').value;
    const position = document.getElementById('position').value;

    logan(name, clubId, price, position, photo);
  });

$(document).on("click", ".deletep", function() {
var ide = $(this).attr("idPlayer");
$(".modal-footer #deleteid").val(ide);
$(".modal-footer #deletebtn").val(ide);
});

  