const express = require('express');
const axios = require('axios');

const ids = [ 
  122, 123, 127, 131, 134, 137, 154, 155, 169, 178, 185, 191, 202, 203, 212, 226, 232, 241, 247, 252, 254, 260, 263, 267, 278, 279, 284, 286, 296, 302, 307, 308, 316, 324, 328, 342, 343, 350, 351, 356, 365, 369, 371, 372 
];
async function getMusi(id) {
  const response = await axios.get(`https://api.meinbezirk.at/v1/content/voteable-upload/${id}/minimal?key=AIzaSyCOhnrdCE4P2-6isUB2KPjAUD5MxbeNyY4&votingGroup=blasmusikchallenge2024`, {
    headers: {
      "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/122.0",
      "Accept": "*/*",
      "Accept-Language": "en-US,en;q=0.5",
      "Content-Type": "application/json",
      "Sec-Fetch-Dest": "empty",
      "Sec-Fetch-Mode": "cors",
      "Sec-Fetch-Site": "same-site",
      "Referer": "https://www.meinbezirk.at/"
    }
  });
  return response.data; // Assuming "Musi" object is within the response data
}

const app = express();

app.get('/list', async (req, res) => {
  try {
    const musiData = [];
    for (let id of ids) {
      const musi = await getMusi(id);
      musiData.push(musi.data);
    }
    const sortedMusi = musiData.sort((a, b) => b.votesCount - a.votesCount); // Sort by voteCount descending
    let html = "<ol>";
    sortedMusi.forEach(musi => {
      html += `<li>${musi.title} - ${musi.votesCount}</li>`;
    });
    // const result = sortedMusi.reduce((acc, musi) => {
    //   acc[musi.title] = musi.votesCount;
    //   return acc;
    // }, {}); // Create a map of title and voteCount
    res.set('Content-Type', 'text/html')
    res.send(Buffer.from(html + "</ol>"));
  } catch (error) {
    console.error(error);
    res.status(500).send('Internal Server Error');
  }
});

const port = process.env.PORT || 3000; // Use environment variable for port or default to 3000

app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});
