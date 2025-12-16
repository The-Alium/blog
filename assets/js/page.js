const pageScriptElement = document.currentScript;
const oid =
  pageScriptElement && pageScriptElement.getAttribute("data-oid")
    ? pageScriptElement.getAttribute("data-oid")
    : (console.error("data-oid is null"), null);
const oid_likes =
  pageScriptElement && pageScriptElement.getAttribute("data-oid-likes")
    ? pageScriptElement.getAttribute("data-oid-likes")
    : (console.error("data-oid-likes is null"), null);

const page_id = oid ? oid.replaceAll("/", "-") : oid;

if (typeof auth !== "undefined") {
  const viewed = localStorage.getItem(page_id);

  if (!viewed) {
    auth
      .signInAnonymously()
      .then(() => {
        const docRef = db.collection("views").doc(page_id);
        localStorage.setItem(page_id, true);
        docRef
          .get()
          .then((doc) => {
            if (doc.exists) {
              db.collection("views")
                .doc(page_id)
                .update({
                  views: firebase.firestore.FieldValue.increment(1),
                });
            } else {
              db.collection("views").doc(page_id).set({ views: 1 });
            }
          })
          .catch((error) => {
            console.log("Error getting document:", error);
          });
      })
      .catch((error) => {
        const errorCode = error.code;
        const errorMessage = error.message;
        console.error(errorCode, errorMessage);
      });
  }
}

function process_article() {}
