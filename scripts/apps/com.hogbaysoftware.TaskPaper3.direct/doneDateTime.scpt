JsOsaDAS1.001.00bplist00�Vscript_Qfunction TaskPaperContextScript(editor, options) {

  function setAttribute(editor, items, name, value) {
    var outline = editor.outline;
    var selection = editor.selection;	
    outline.groupUndoAndChanges(function() {
      items.forEach(function (each) {
        each.setAttribute(name, value);
      });
    });	
    editor.moveSelectionToItems(selection);
  }

  function toggleAttribute(editor, items, name, value) {
    items.forEach(function (each) {
      if (each.hasAttribute(name)) {
        value = null; // If any item has the attribute, then remove it from all.
      }
    });
    setAttribute(editor, items, name, value);
  }

toggleAttribute(editor, editor.selection.selectedItems, 'data-done', DateTime.format('this minute'));
}

Application("TaskPaper").documents[0].evaluate({
  script: TaskPaperContextScript.toString()
});                              g jscr  ��ޭ