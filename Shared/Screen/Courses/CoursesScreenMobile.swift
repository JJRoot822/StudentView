//
//  CoursesScreenMobile.swift
//  StudentView
//
//  Created by Joshua Root on 8/19/22.
//

import SwiftUI

struct CoursesScreenMobile: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [
            NSSortDescriptor(
                keyPath: \Course.name,
                ascending: true
            )
        ],
        animation: .default
    )
    private var courses: FetchedResults<Course>

    @State private var searchTerm: String = ""
    @State private var isEditing: Bool = false
    @State private var isAdding: Bool = false
    @State private var id: UUID = UUID()
    
    var editButton: some View {
        Button(action: {
            isEditing.toggle()
        }, label: {
            Label("Edit Course", systemImage: "pencil")
        })
        .tint(.blue)
    }
    
    var body: some View {
        NavigationView {
            Group {
                if courses.count > 0 {
                    List {
                        ForEach(filterCourses(), id: \.name.self) { course in
                            CourseCell(course: course)
                                .swipeActions(edge: .leading, allowsFullSwipe: false) { editButton }
                                .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                                    Button(action: {
                                        withAnimation {
                                            CoreDataUtil.delete(object: course, context: viewContext)
                                        }
                                    }, label: {
                                        Label("Delete", systemImage: "trash")
                                    })
                                    .tint(.red)
                                }
                                .contextMenu {
                                    editButton
                                    
                                    Button(action: {
                                        withAnimation {
                                            CoreDataUtil.delete(object: course, context: viewContext)
                                        }
                                    }, label: {
                                        Label("Delete Course", systemImage: "trash")
                                            .foregroundColor(.red)
                                    })
                                    .tint(.red)
                                }
                                .sheet(isPresented: $isEditing, onDismiss: {
                                    id = UUID()
                                }, content: {
                                    EditCourseScreenMobile(course: course)
                                })
                        }
                    }
                } else {
                    Text("No Courses to Show Right Now")
                        .foregroundColor(.secondary)
                        .italic()
                }
            }
            .id(id)
            .navigationTitle(Text("Courses"))
            .searchable(text: $searchTerm, prompt: Text("Search Courses"))
            .toolbar {
                Button(action: {
                    isAdding.toggle()
                }, label: {
                    Label("Add Course", systemImage: "plus")
                })
                .labelStyle(.iconOnly)
            }
            .sheet(isPresented: $isAdding) {
                AddCourseScreen()
            }
        }
        #if os(iOS)
        .navigationViewStyle(.stack)
        #endif
    }
    
    private func onDelete(at offset: IndexSet) {
        withAnimation {
            offset.map {
                return courses[$0]
            }.forEach {
                CoreDataUtil.delete(object: $0, context: viewContext)
            }
        }
    }
    
    private func filterCourses() -> [Course] {
        if searchTerm.isEmpty {
            return courses.map { $0 }
        } else {
            return courses.filter { course in
                let nameContainsTerm: Bool = course.courseName.contains(searchTerm)
                let firstNameContainsTerm: Bool = course.courseInstructorFirstName.contains(searchTerm)
                let lastNameContainsTerm: Bool = course.courseInstructorLastName.contains(searchTerm)
                
                return nameContainsTerm || firstNameContainsTerm || lastNameContainsTerm
            }
        }
    }
}
