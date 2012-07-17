class Filterer extends Spine.Controller
  @extend(Spine.Events)

  elements:
    ".filter-actions" : "filterActions"

  events:
    "click #state-button" : "filterByState"
    "click #subject-button" : "filterBySubject"
    "click #grade-button" : "filterByGrade"
    "click .grade_button" : "gradeList"
    "click #math-science-button" : "showMathSubjects"
    "click #music-arts-button" : "showMusicSubjects"
    "click #literacy-language-button" : "showLiteracySubjects"
    "click #history-civics-button" : "showHistorySubjects"
    "click #special-needs-button" : "showSpecialNeeds"
    "click #applied-learning-button" : "showAppliedLearningSubjects"
    "click #health-sports-button" : "showHealthSubjects"
    "click .sub-subject" : "changeButtonText"

  constructor: ->
    super

  filterByState: (e) ->
    $(".filter_button").removeClass("active")
    $("#state-button").addClass("active")
    @filterActions.empty()
    @el.height(700)
    @filterActions.append @view('filters/states')
    $("#map").usmap click: (event, data) ->
      $('path[style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 1; cursor: pointer; "]').attr({class:"state", fill:"#00000", style: "-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 0; cursor: pointer; "})
      $('rect[style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 1; cursor: pointer; "]').attr({fill: "#000000", style: "-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 0; cursor: pointer; "})
      $(event.originalEvent.target).attr({fill: "#FF0000", style: "-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 1; cursor: pointer; ", class: "active-state"})
      console.log $(event.originalEvent.target)
      $("#state-button").text "State: "+data.name

  filterBySubject: (e) ->
    $(".filter_button").removeClass("active")
    $("#subject-button").addClass("active")

    @el.height(250)
    @filterActions.empty()
    @filterActions.append @view('filters/subjects')

  filterByGrade: (e) ->
    $(".filter_button").removeClass("active")
    $("#grade-button").addClass("active")
    @filterActions.empty()
    @el.height(200)
    @filterActions.append @view('filters/grades')

  showMathSubjects: (e) ->
    $("#math-science-subjects").show()
    $("#subject-buttons-container").hide()
    $("#subject-button").text("Math and Science")
    $("#subject-button").addClass("shrink")

  showMusicSubjects: (e) ->
    $("#music-art-subjects").show()
    $("#subject-buttons-container").hide()
    $("#subject-button").text("Music and the Arts")
    $("#subject-button").addClass("shrink")

  showLiteracySubjects: (e) ->
    $("#literacy-language-subjects").show()
    $("#subject-buttons-container").hide()
    $("#subject-button").text("Literacy and Language")
    $("#subject-button").addClass("shrink")

  showHistorySubjects: (e) ->
    $("#history-civics-subjects").show()
    $("#subject-buttons-container").hide()
    $("#subject-button").text("History and Civics")
    $("#subject-button").addClass("shrink")

  showSpecialNeeds: (e) ->
    $("#subject-button").removeClass("shrink")
    $("#subject-button").text("Special Needs")

  showAppliedLearningSubjects: (e) ->
    $("#applied-learning-subjects").show()
    $("#subject-buttons-container").hide()
    $("#subject-button").text("Applied Learning")
    $("#subject-button").addClass("shrink")

  showHealthSubjects: (e) ->
    $("#health-sports-subjects").show()
    $("#subject-buttons-container").hide()
    $("#subject-button").text("Health and Sports")
    $("#subject-button").addClass("shrink")

  changeButtonText: (e) ->
    sub_subject_button = $(e.target)
    $("#subject-button").text(sub_subject_button.attr('id'))

  gradeList: (e) ->
    $(".grade_button").removeClass("active")
    grade_button = $(e.target)
    grade_button.addClass("active")
    $("#grade-button").text(grade_button.attr('id'))
    console.log(grade_button.attr('id'))

window.Filterer = Filterer
