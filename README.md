<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="generator" content="pandoc" />

<meta name="author" content="James Primrose" />


<title>Readme</title>
<style type="text/css">
  pre:not([class]) {
    background-color: white;
  }
</style>
<script type="text/javascript">
if (window.hljs && document.readyState && document.readyState === "complete") {
   window.setTimeout(function() {
      hljs.initHighlighting();
   }, 0);
}
</script>



</head>

<body>

<style type="text/css">
.main-container {
  max-width: 940px;
  margin-left: auto;
  margin-right: auto;
}
</style>
<div class="container-fluid main-container">


<div id="header">
<h1 class="title">Readme</h1>
<h4 class="author"><em>James Primrose</em></h4>
<h4 class="date"><em>9/21/2014</em></h4>
</div>


<div id="gcdproject" class="section level1">
<h1>GCDProject</h1>
<p>My process was as follows:</p>
<ol style="list-style-type: decimal">
<li>download data zip: <a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip">https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip</a><br /></li>
<li>read in features.txt &amp; remove punctuation<br /></li>
<li>read in activity_labels.txt and clean up column names<br /></li>
<li>read in X_test.txt data and add cleaned up column names from step 2<br /></li>
<li>subset X_test.txt and retrieve only columns containing “mean” or “std”<br /></li>
<li>read in y_test.txt data and assign column names<br /></li>
<li>merge the activity data and the y_test data<br /></li>
<li>read in subject_test.txt and assign column names<br /></li>
<li>column bind the subject data to the merged activity data<br /></li>
<li>column bind the subject / activity data to the subsetted test set from step 5<br /></li>
<li>read in the X_train.txt data and add cleaned up column names from step 2<br /></li>
<li>subset X_train.txt and retrieve only columns containing “mean” or “std”<br /></li>
<li>read in the y_train.txt data and assign column names<br /></li>
<li>merge the activity data and the y_train data<br /></li>
<li>read in subject_train.txt and assign column values<br /></li>
<li>column bind the subject data to the merged activity data<br /></li>
<li>column bind the subject / activity data to the subsetted test set from step 12<br /></li>
<li>row bind the train data to the test data<br /></li>
<li>aggregate the data by activity and subject providing a mean value per variable<br /></li>
<li>write out the data to tidy.txt</li>
</ol>
</div>


</div>

<script>

// add bootstrap table styles to pandoc tables
$(document).ready(function () {
  $('tr.header').parent('thead').parent('table').addClass('table table-condensed');
});

</script>

<!-- dynamically load mathjax for compatibility with self-contained -->
<script>
  (function () {
    var script = document.createElement("script");
    script.type = "text/javascript";
    script.src  = "https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML";
    document.getElementsByTagName("head")[0].appendChild(script);
  })();
</script>

</body>
</html>
