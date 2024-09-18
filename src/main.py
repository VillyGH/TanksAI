from src.constants import *
import pygame

def init():
    pygame.init()

    screen = pygame.display.set_mode((WINDOW_WIDTH, WINDOW_HEIGHT))
    pygame.display.set_caption("Tanks AI")

    running = True
    clock = pygame.time.Clock()

    while running:
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                running = False
        screen.fill(WHITE)

        pygame.display.flip()

        clock.tick(120)

    pygame.quit()
