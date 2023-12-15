from flask import Flask, jsonify
import requests
from bs4 import BeautifulSoup

app = Flask(__name__)

@app.route('/api/questions', methods=['GET'])
def get_questions():
    try:
        # Make a GET request to the URL
        response = requests.get('https://etesty2.mdcr.cz/Home/Tests/ro')

        # Check if the request was successful (status code 200)
        if response.status_code == 200:
            # Parse HTML content
            soup = BeautifulSoup(response.content, 'html.parser')

            # Extract questions (modify based on HTML structure)
            questions = [question.text.strip() for question in soup.select('.question-text')]

            # Return the questions as JSON
            return jsonify(questions=questions)
        else:
            # Return an error message if the request was not successful
            return jsonify(error=f"Failed to fetch questions. Status code: {response.status_code}")

    except Exception as e:
        # Return an error message if an exception occurs
        return jsonify(error=str(e))

if __name__ == '__main__':
    app.run(debug=True)
