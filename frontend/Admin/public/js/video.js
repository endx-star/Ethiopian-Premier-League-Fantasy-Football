/* eslint-disable*/

document.querySelector('.form').addEventListener('submit', e => {
    e.preventDefault();
    const url = document.getElementById("url").value;
    const title = document.getElementById('title').value;
    logs(url, title);
  });

  export const logs = async (url, title) => {
    try {
      const res = await axios({
        method: 'POST',
        url: 'http://localhost:3000/api/v1/highlights',
        data: {
          url,
          title

        }
      });
  
      console.log(res);
      if (res.data.status === 'success') {
        showAlert('success', 'Link Added');
        
      }
    } catch (err) {
      console.log(err.response.data);
    }
  };





// const axios = require('axios');




// export const logout = async () => {
//   try {
//     const res = await axios({
//       method: 'GET',
//       url: '/api/v1/users/logout'
//     });
//     if ((res.data.status = 'success')) location.reload(true);
//   } catch (err) {
//     console.log(err.response);
//     showAlert('error', 'Error logging out! Try again.');
//   }
// };
