<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Q & A</title>
    <!-- font-awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" />
    <!-- extra fonts -->
    <link
      href="https://fonts.googleapis.com/css?family=Great+Vibes&display=swap"
      rel="stylesheet"
    />
    
    <link rel="stylesheet" href="assets/css/styles.css" />
  </head>
  <body style ="background: linear-gradient(to right, #bdc3c7, #2c3e50);">
      <section class="questions">
        <!-- title -->
        <div class="title">
            <h2 style="font-family: Georgia;">FREQUENTLY ASKED QUESTIONS</h2>
        </div>
        <!-- questions -->
        <div class="section-center">
          <!-- single question -->
          <article class="question">
            <!-- question title -->
            <div class="question-title">
              <p>Is this software fully secure?</p>
              <button type="button" class="question-btn">
                <span class="plus-icon">
                  <i class="far fa-plus-square"></i>
                </span>
                <span class="minus-icon">
                  <i class="far fa-minus-square"></i>
                </span>
              </button>
            </div>
            <!-- question text -->
            <div class="question-text">
              <p>
               Yes! The software is developed with full assurity of end to end encryption. There is no possibility of losing your data.
              </p>
            </div>
          </article>
          <!-- end of single question -->
          <!-- single question -->
          <article class="question">
            <!-- question title -->
            <div class="question-title">
              <p>How this software works?</p>
              <button type="button" class="question-btn">
                <span class="plus-icon">
                  <i class="far fa-plus-square"></i>
                </span>
                <span class="minus-icon">
                  <i class="far fa-minus-square"></i>
                </span>
              </button>
            </div>
            <!-- question text -->
            <div class="question-text">
              <p>
                The Online Voting System is a simple project that represents the Election Voting Process such as school officer elections. The system is easy to use for both admin and voters sides. The admin will manage all the polling data requirements which are the Category (the category will represent the positions), voting list, and the user or the voters. The admin can create and manage candidates and the maximum count of voter's selection per category. The voters can also view the poll standings after they vote.
              </p>
            </div>
          </article>
          <!-- end of single question -->
          <!-- single question -->
          <article class="question">
            <!-- question title -->
            <div class="question-title">
              <p>How live voting will be performed?</p>
              <!-- button -->
              <button type="button" class="question-btn">
                <span class="plus-icon">
                  <i class="far fa-plus-square"></i>
                </span>
                <span class="minus-icon">
                  <i class="far fa-minus-square"></i>
                </span>
              </button>
            </div>
            <!-- question text -->
            <div class="question-text">
              <p>
               A link will be send to voter's Phone Number. As soon as he clicks on the link,live voting platform will be activated for that particular user.
              </p>
            </div>
          </article>
          <article class="question">
            <!-- question title -->
            <div class="question-title">
              <p>When the results will be released?</p>
              <button type="button" class="question-btn">
                <span class="plus-icon">
                  <i class="far fa-plus-square"></i>
                </span>
                <span class="minus-icon">
                  <i class="far fa-minus-square"></i>
                </span>
              </button>
            </div>
            <!-- question text -->
            <div class="question-text">
              <p>
                Results will be available to you in a span of one to two days.
                <br>
                Thanku!
              </p>
            </div>
          </article>
          <!-- end of single question -->
      </section>
    </main>
    <!-- javascript -->
    <script>
        const questions = document.querySelectorAll(".question");

questions.forEach(function (question) {
  const btn = question.querySelector(".question-btn");
  // console.log(btn);

  btn.addEventListener("click", function () {
    // console.log(question);

    questions.forEach(function (item) {
      if (item !== question) {
        item.classList.remove("show-text");
      }
    });

    question.classList.toggle("show-text");
  });
});
    </script>
  </body>
</html>