/// <reference types="cypress" />

describe('Jungle App', () => {

  it('Navigate to home page',()=>{
    cy.visit("/");
    cy.get(".products").should('exist'); // ensure that the products container exists
  })

  it("There is products on the page", () => {
    cy.get(".products").should('exist'); // ensure that the products container exists
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
  
})
