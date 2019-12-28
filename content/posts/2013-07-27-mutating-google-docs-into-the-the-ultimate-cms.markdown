---
categories:
- usability
date: "2013-07-27T00:00:00Z"
published: true
status: publish
tags: []
title: Mutating Google Docs into the the ultimate CMS
---
During the last months I was thinking about dropping Wordpress and going plain, static plan on my website.<!--more-->

During the last decade I used lots of solutions, starting with HTML with [SSI], [Drupal](https://drupal.org/), [CMSMadeSimple](http://www.cmsmadesimple.org/), [Joomla](https://www.joomla.org/) [DokuWiki](https://www.dokuwiki.org/dokuwiki), [MediaWiki](https://www.mediawiki.org/wiki/MediaWiki), [Confluence] and obviously the well known [Wordpress](https://wordpress.org/)<!--more-->

Wordpress was by far the best option but still the plugin nightmare is always going to hit you, especially with plugins that became broken in time, commercial or both.

So, many things changed from the time when I was using HTML with [SSI][SSI], but due to the JavaScript and HTML5 progress, I think that now it's time to return to static.

## How do I envision the solution? ##

My dream solution would be one that would allow me update or add a webpage very easily, have a history of changes and allow me to do a peer-review before publishing it.

A Google Drive shared folder where you keep most web pages as Docs, this can include subfolders which would map accordingly on the generated site.

A special Google Drive "index" spreadsheet which would contain meta information about the pages, like:

   * url to publish, defaults to the google document name
   * redirects, keeping track of redirects

The list of documents inside the index.spreadsheet would be updated automatically by the compiler script which would scan the entire google shared folder and would then refresh the document.

A publishing script, probably written in my favourite language, that would grab this information and generate the static site by adding all the boilerplate: styling and other stuff. The final result would be a directory structure that could be published anywhere. Maybe it would also include some Nginx configuration file for the redirects.

Among the features that could be added to the compiler (no name yet) are: site map generator, enabling comments using a 2rd party system like discuss or Facebook comments.

Still the most important the ability to add new features into new recipe files - some kind of droppable plugins. The compiler will look for all the recipes inside the directory and apply them, allowing you to add new functionality by just copying a recipe from one site to another.

Obviously the site compiler could be stored on git, mercurial or Dropbox, according to your preference.

## Features to add in time ##

 *   Enable RSS feeds, so this would also act like a blog
 *   Find a decent and free solution for providing search functionality
 *   Compile time includes - so you could specify that a part of the page should be included from somewhere else.
 *   Live includes - so you can use JavaScript to load content when the page is loaded into the browser
 *   Contact forms via Google Forms, obviously :)
 *   Ability to publish documents from other sources, like markdown files from a SCM repository
 *   CDN publish option, like Amazon S3
 
## Open questions ##

 *   How to control the publishing with Google Docs? I know that I can enable auto-publishing but clearly that’s not what I want, I want to be able to publish a document when I want. Maybe it would require some Google Drive scripting in the end.

 *   How to deal with document renames, ideally these would be detected and old names would be added as redirects inside the index table.

## Feedback ##

While this is currently only the concept phase it would be quite helpful to get some feedback from others.

*  What do you think about this?
*  Do you know about existing work that is close to what I am describing? ...maybe I should try extending something that already exists instead of creating a new project.
*  Would you give a hand in creating this?