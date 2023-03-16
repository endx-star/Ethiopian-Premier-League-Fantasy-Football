var pclub =  $("#idstore").attr("att");
$("#clubdropdown").val(pclub);


var ppos =  $("#idstor").attr("att");
$("#positiondrop").val(ppos);


const log = async (name, clubId, price, position, photo, pid) => {
    try {
        const res = await axios({
          method: 'patch',
          url: `http://127.0.0.1:3000/api/v1/players/${pid}`,
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
    const clubId = document.getElementById('clubdropdown').value;
    const photo = document.getElementById('photo').value;
    const price = document.getElementById('price').value;
    const position = document.getElementById('positiondrop').value;
    const pid = document.getElementById('pid').value;

    log(name, clubId, price, position, photo, pid);
  });